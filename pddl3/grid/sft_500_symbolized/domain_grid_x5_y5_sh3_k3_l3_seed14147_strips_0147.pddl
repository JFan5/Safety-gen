(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v3 ?v4)
             (pred_10 ?v7 ?v5)
             (pred_6 ?v3 ?v5)
             (pred_9 ?v8 ?v3 )
	     (pred_4 ?v3)
             (pred_1 ?v11)
             (pred_3 ?v7)
             (pred_2 ?v5)
             (pred_12 ?v3)
             (pred_5 ?v7)
             (pred_8 ?v3)
             (pred_11 ))



(:action op_1
:parameters (?v2 ?v6 ?v12 ?v10)
:precondition (and (pred_1 ?v2) (pred_1 ?v6) (pred_3 ?v12) (pred_2 ?v10)
          (pred_7 ?v2 ?v6) (pred_10 ?v12 ?v10)
                   (pred_6 ?v6 ?v10) (pred_4 ?v2) 
                   (pred_12 ?v6) (pred_5 ?v12))
:effect (and  (pred_8 ?v6) (not (pred_12 ?v6))))


(:action op_4
:parameters (?v2 ?v9)
:precondition (and (pred_1 ?v2) (pred_1 ?v9)
               (pred_4 ?v2) (pred_7 ?v2 ?v9) (pred_8 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v2))))

(:action op_3
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_3 ?v12) 
                  (pred_4 ?v2) (pred_9 ?v12 ?v2) (pred_11 ))
:effect (and (pred_5 ?v12)
   (not (pred_9 ?v12 ?v2)) (not (pred_11 ))))


(:action op_5
:parameters (?v2 ?v1 ?v13)
:precondition (and (pred_1 ?v2) (pred_3 ?v1) (pred_3 ?v13)
                  (pred_4 ?v2) (pred_5 ?v13) (pred_9 ?v1 ?v2))
:effect (and (pred_5 ?v1) (pred_9 ?v13 ?v2)
        (not (pred_5 ?v13)) (not (pred_9 ?v1 ?v2))))

(:action op_2
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_3 ?v12) 
                  (pred_4 ?v2) (pred_5 ?v12))
:effect (and (pred_11 ) (pred_9 ?v12 ?v2) (not (pred_5 ?v12)))))


	
