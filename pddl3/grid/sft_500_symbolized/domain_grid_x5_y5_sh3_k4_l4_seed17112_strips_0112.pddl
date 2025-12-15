(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v11)
             (pred_4 ?v9 ?v2)
             (pred_10 ?v10 ?v2)
             (pred_6 ?v5 ?v10 )
	     (pred_2 ?v10)
             (pred_12 ?v7)
             (pred_5 ?v9)
             (pred_11 ?v2)
             (pred_9 ?v10)
             (pred_8 ?v9)
             (pred_3 ?v10)
             (pred_7 ))



(:action op_4
:parameters (?v3 ?v6 ?v1 ?v8)
:precondition (and (pred_12 ?v3) (pred_12 ?v6) (pred_5 ?v1) (pred_11 ?v8)
          (pred_1 ?v3 ?v6) (pred_4 ?v1 ?v8)
                   (pred_10 ?v6 ?v8) (pred_2 ?v3) 
                   (pred_9 ?v6) (pred_8 ?v1))
:effect (and  (pred_3 ?v6) (not (pred_9 ?v6))))


(:action op_3
:parameters (?v3 ?v13)
:precondition (and (pred_12 ?v3) (pred_12 ?v13)
               (pred_2 ?v3) (pred_1 ?v3 ?v13) (pred_3 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v3))))

(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_12 ?v3) (pred_5 ?v1) 
                  (pred_2 ?v3) (pred_6 ?v1 ?v3) (pred_7 ))
:effect (and (pred_8 ?v1)
   (not (pred_6 ?v1 ?v3)) (not (pred_7 ))))


(:action op_1
:parameters (?v3 ?v4 ?v12)
:precondition (and (pred_12 ?v3) (pred_5 ?v4) (pred_5 ?v12)
                  (pred_2 ?v3) (pred_8 ?v12) (pred_6 ?v4 ?v3))
:effect (and (pred_8 ?v4) (pred_6 ?v12 ?v3)
        (not (pred_8 ?v12)) (not (pred_6 ?v4 ?v3))))

(:action op_5
:parameters (?v3 ?v1)
:precondition (and (pred_12 ?v3) (pred_5 ?v1) 
                  (pred_2 ?v3) (pred_8 ?v1))
:effect (and (pred_7 ) (pred_6 ?v1 ?v3) (not (pred_8 ?v1)))))


	
