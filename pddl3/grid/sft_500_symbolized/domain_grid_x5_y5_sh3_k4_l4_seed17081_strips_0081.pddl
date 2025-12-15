(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v5 ?v4)
             (pred_3 ?v10 ?v8)
             (pred_2 ?v5 ?v8)
             (pred_10 ?v1 ?v5 )
	     (pred_9 ?v5)
             (pred_1 ?v6)
             (pred_12 ?v10)
             (pred_5 ?v8)
             (pred_6 ?v5)
             (pred_8 ?v10)
             (pred_7 ?v5)
             (pred_11 ))



(:action op_4
:parameters (?v12 ?v13 ?v7 ?v3)
:precondition (and (pred_1 ?v12) (pred_1 ?v13) (pred_12 ?v7) (pred_5 ?v3)
          (pred_4 ?v12 ?v13) (pred_3 ?v7 ?v3)
                   (pred_2 ?v13 ?v3) (pred_9 ?v12) 
                   (pred_6 ?v13) (pred_8 ?v7))
:effect (and  (pred_7 ?v13) (not (pred_6 ?v13))))


(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_1 ?v12) (pred_1 ?v9)
               (pred_9 ?v12) (pred_4 ?v12 ?v9) (pred_7 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v12))))

(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_1 ?v12) (pred_12 ?v7) 
                  (pred_9 ?v12) (pred_10 ?v7 ?v12) (pred_11 ))
:effect (and (pred_8 ?v7)
   (not (pred_10 ?v7 ?v12)) (not (pred_11 ))))


(:action op_5
:parameters (?v12 ?v11 ?v2)
:precondition (and (pred_1 ?v12) (pred_12 ?v11) (pred_12 ?v2)
                  (pred_9 ?v12) (pred_8 ?v2) (pred_10 ?v11 ?v12))
:effect (and (pred_8 ?v11) (pred_10 ?v2 ?v12)
        (not (pred_8 ?v2)) (not (pred_10 ?v11 ?v12))))

(:action op_2
:parameters (?v12 ?v7)
:precondition (and (pred_1 ?v12) (pred_12 ?v7) 
                  (pred_9 ?v12) (pred_8 ?v7))
:effect (and (pred_11 ) (pred_10 ?v7 ?v12) (not (pred_8 ?v7)))))


	
