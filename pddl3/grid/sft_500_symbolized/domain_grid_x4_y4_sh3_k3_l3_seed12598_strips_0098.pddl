(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v9)
             (pred_3 ?v3 ?v8)
             (pred_4 ?v13 ?v8)
             (pred_6 ?v12 ?v13 )
	     (pred_5 ?v13)
             (pred_2 ?v11)
             (pred_12 ?v3)
             (pred_7 ?v8)
             (pred_8 ?v13)
             (pred_1 ?v3)
             (pred_11 ?v13)
             (pred_9 ))



(:action op_4
:parameters (?v1 ?v7 ?v2 ?v6)
:precondition (and (pred_2 ?v1) (pred_2 ?v7) (pred_12 ?v2) (pred_7 ?v6)
          (pred_10 ?v1 ?v7) (pred_3 ?v2 ?v6)
                   (pred_4 ?v7 ?v6) (pred_5 ?v1) 
                   (pred_8 ?v7) (pred_1 ?v2))
:effect (and  (pred_11 ?v7) (not (pred_8 ?v7))))


(:action op_1
:parameters (?v1 ?v4)
:precondition (and (pred_2 ?v1) (pred_2 ?v4)
               (pred_5 ?v1) (pred_10 ?v1 ?v4) (pred_11 ?v4))
:effect (and (pred_5 ?v4) (not (pred_5 ?v1))))

(:action op_3
:parameters (?v1 ?v2)
:precondition (and (pred_2 ?v1) (pred_12 ?v2) 
                  (pred_5 ?v1) (pred_6 ?v2 ?v1) (pred_9 ))
:effect (and (pred_1 ?v2)
   (not (pred_6 ?v2 ?v1)) (not (pred_9 ))))


(:action op_2
:parameters (?v1 ?v5 ?v10)
:precondition (and (pred_2 ?v1) (pred_12 ?v5) (pred_12 ?v10)
                  (pred_5 ?v1) (pred_1 ?v10) (pred_6 ?v5 ?v1))
:effect (and (pred_1 ?v5) (pred_6 ?v10 ?v1)
        (not (pred_1 ?v10)) (not (pred_6 ?v5 ?v1))))

(:action op_5
:parameters (?v1 ?v2)
:precondition (and (pred_2 ?v1) (pred_12 ?v2) 
                  (pred_5 ?v1) (pred_1 ?v2))
:effect (and (pred_9 ) (pred_6 ?v2 ?v1) (not (pred_1 ?v2)))))


	
