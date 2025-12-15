(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v9)
             (pred_7 ?v6 ?v10)
             (pred_8 ?v2 ?v10)
             (pred_12 ?v11 ?v2 )
	     (pred_3 ?v2)
             (pred_5 ?v3)
             (pred_6 ?v6)
             (pred_2 ?v10)
             (pred_11 ?v2)
             (pred_9 ?v6)
             (pred_4 ?v2)
             (pred_1 ))



(:action op_4
:parameters (?v12 ?v13 ?v5 ?v4)
:precondition (and (pred_5 ?v12) (pred_5 ?v13) (pred_6 ?v5) (pred_2 ?v4)
          (pred_10 ?v12 ?v13) (pred_7 ?v5 ?v4)
                   (pred_8 ?v13 ?v4) (pred_3 ?v12) 
                   (pred_11 ?v13) (pred_9 ?v5))
:effect (and  (pred_4 ?v13) (not (pred_11 ?v13))))


(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_5 ?v12) (pred_5 ?v7)
               (pred_3 ?v12) (pred_10 ?v12 ?v7) (pred_4 ?v7))
:effect (and (pred_3 ?v7) (not (pred_3 ?v12))))

(:action op_2
:parameters (?v12 ?v5)
:precondition (and (pred_5 ?v12) (pred_6 ?v5) 
                  (pred_3 ?v12) (pred_12 ?v5 ?v12) (pred_1 ))
:effect (and (pred_9 ?v5)
   (not (pred_12 ?v5 ?v12)) (not (pred_1 ))))


(:action op_5
:parameters (?v12 ?v1 ?v8)
:precondition (and (pred_5 ?v12) (pred_6 ?v1) (pred_6 ?v8)
                  (pred_3 ?v12) (pred_9 ?v8) (pred_12 ?v1 ?v12))
:effect (and (pred_9 ?v1) (pred_12 ?v8 ?v12)
        (not (pred_9 ?v8)) (not (pred_12 ?v1 ?v12))))

(:action op_3
:parameters (?v12 ?v5)
:precondition (and (pred_5 ?v12) (pred_6 ?v5) 
                  (pred_3 ?v12) (pred_9 ?v5))
:effect (and (pred_1 ) (pred_12 ?v5 ?v12) (not (pred_9 ?v5)))))


	
