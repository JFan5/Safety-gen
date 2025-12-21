(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v2)
             (pred_11 ?v13 ?v11)
             (pred_4 ?v3 ?v11)
             (pred_10 ?v9 ?v3 )
	     (pred_7 ?v3)
             (pred_8 ?v12)
             (pred_3 ?v13)
             (pred_2 ?v11)
             (pred_5 ?v3)
             (pred_6 ?v13)
             (pred_1 ?v3)
             (pred_12 ))



(:action op_1
:parameters (?v1 ?v6 ?v5 ?v8)
:precondition (and (pred_8 ?v1) (pred_8 ?v6) (pred_3 ?v5) (pred_2 ?v8)
          (pred_9 ?v1 ?v6) (pred_11 ?v5 ?v8)
                   (pred_4 ?v6 ?v8) (pred_7 ?v1) 
                   (pred_5 ?v6) (pred_6 ?v5))
:effect (and  (pred_1 ?v6) (not (pred_5 ?v6))))


(:action op_5
:parameters (?v1 ?v7)
:precondition (and (pred_8 ?v1) (pred_8 ?v7)
               (pred_7 ?v1) (pred_9 ?v1 ?v7) (pred_1 ?v7))
:effect (and (pred_7 ?v7) (not (pred_7 ?v1))))

(:action op_2
:parameters (?v1 ?v5)
:precondition (and (pred_8 ?v1) (pred_3 ?v5) 
                  (pred_7 ?v1) (pred_10 ?v5 ?v1) (pred_12 ))
:effect (and (pred_6 ?v5)
   (not (pred_10 ?v5 ?v1)) (not (pred_12 ))))


(:action op_3
:parameters (?v1 ?v10 ?v4)
:precondition (and (pred_8 ?v1) (pred_3 ?v10) (pred_3 ?v4)
                  (pred_7 ?v1) (pred_6 ?v4) (pred_10 ?v10 ?v1))
:effect (and (pred_6 ?v10) (pred_10 ?v4 ?v1)
        (not (pred_6 ?v4)) (not (pred_10 ?v10 ?v1))))

(:action op_4
:parameters (?v1 ?v5)
:precondition (and (pred_8 ?v1) (pred_3 ?v5) 
                  (pred_7 ?v1) (pred_6 ?v5))
:effect (and (pred_12 ) (pred_10 ?v5 ?v1) (not (pred_6 ?v5)))))


	
