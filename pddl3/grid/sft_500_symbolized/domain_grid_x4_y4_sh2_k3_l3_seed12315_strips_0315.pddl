(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v11)
             (pred_6 ?v7 ?v8)
             (pred_12 ?v5 ?v8)
             (pred_2 ?v6 ?v5 )
	     (pred_9 ?v5)
             (pred_7 ?v1)
             (pred_5 ?v7)
             (pred_3 ?v8)
             (pred_10 ?v5)
             (pred_1 ?v7)
             (pred_8 ?v5)
             (pred_4 ))



(:action op_2
:parameters (?v12 ?v13 ?v3 ?v2)
:precondition (and (pred_7 ?v12) (pred_7 ?v13) (pred_5 ?v3) (pred_3 ?v2)
          (pred_11 ?v12 ?v13) (pred_6 ?v3 ?v2)
                   (pred_12 ?v13 ?v2) (pred_9 ?v12) 
                   (pred_10 ?v13) (pred_1 ?v3))
:effect (and  (pred_8 ?v13) (not (pred_10 ?v13))))


(:action op_4
:parameters (?v12 ?v4)
:precondition (and (pred_7 ?v12) (pred_7 ?v4)
               (pred_9 ?v12) (pred_11 ?v12 ?v4) (pred_8 ?v4))
:effect (and (pred_9 ?v4) (not (pred_9 ?v12))))

(:action op_5
:parameters (?v12 ?v3)
:precondition (and (pred_7 ?v12) (pred_5 ?v3) 
                  (pred_9 ?v12) (pred_2 ?v3 ?v12) (pred_4 ))
:effect (and (pred_1 ?v3)
   (not (pred_2 ?v3 ?v12)) (not (pred_4 ))))


(:action op_3
:parameters (?v12 ?v9 ?v10)
:precondition (and (pred_7 ?v12) (pred_5 ?v9) (pred_5 ?v10)
                  (pred_9 ?v12) (pred_1 ?v10) (pred_2 ?v9 ?v12))
:effect (and (pred_1 ?v9) (pred_2 ?v10 ?v12)
        (not (pred_1 ?v10)) (not (pred_2 ?v9 ?v12))))

(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_7 ?v12) (pred_5 ?v3) 
                  (pred_9 ?v12) (pred_1 ?v3))
:effect (and (pred_4 ) (pred_2 ?v3 ?v12) (not (pred_1 ?v3)))))


	
