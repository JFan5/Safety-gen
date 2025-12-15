(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v11)
             (pred_5 ?v7 ?v12)
             (pred_3 ?v2 ?v12)
             (pred_1 ?v10 ?v2 )
	     (pred_7 ?v2)
             (pred_6 ?v4)
             (pred_8 ?v7)
             (pred_4 ?v12)
             (pred_11 ?v2)
             (pred_9 ?v7)
             (pred_10 ?v2)
             (pred_2 ))



(:action op_2
:parameters (?v3 ?v6 ?v1 ?v9)
:precondition (and (pred_6 ?v3) (pred_6 ?v6) (pred_8 ?v1) (pred_4 ?v9)
          (pred_12 ?v3 ?v6) (pred_5 ?v1 ?v9)
                   (pred_3 ?v6 ?v9) (pred_7 ?v3) 
                   (pred_11 ?v6) (pred_9 ?v1))
:effect (and  (pred_10 ?v6) (not (pred_11 ?v6))))


(:action op_5
:parameters (?v3 ?v8)
:precondition (and (pred_6 ?v3) (pred_6 ?v8)
               (pred_7 ?v3) (pred_12 ?v3 ?v8) (pred_10 ?v8))
:effect (and (pred_7 ?v8) (not (pred_7 ?v3))))

(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_6 ?v3) (pred_8 ?v1) 
                  (pred_7 ?v3) (pred_1 ?v1 ?v3) (pred_2 ))
:effect (and (pred_9 ?v1)
   (not (pred_1 ?v1 ?v3)) (not (pred_2 ))))


(:action op_4
:parameters (?v3 ?v5 ?v13)
:precondition (and (pred_6 ?v3) (pred_8 ?v5) (pred_8 ?v13)
                  (pred_7 ?v3) (pred_9 ?v13) (pred_1 ?v5 ?v3))
:effect (and (pred_9 ?v5) (pred_1 ?v13 ?v3)
        (not (pred_9 ?v13)) (not (pred_1 ?v5 ?v3))))

(:action op_3
:parameters (?v3 ?v1)
:precondition (and (pred_6 ?v3) (pred_8 ?v1) 
                  (pred_7 ?v3) (pred_9 ?v1))
:effect (and (pred_2 ) (pred_1 ?v1 ?v3) (not (pred_9 ?v1)))))


	
