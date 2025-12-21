(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v12)
             (pred_9 ?v6 ?v8)
             (pred_7 ?v10 ?v8)
             (pred_10 ?v2 ?v10 )
	     (pred_1 ?v10)
             (pred_8 ?v11)
             (pred_6 ?v6)
             (pred_3 ?v8)
             (pred_5 ?v10)
             (pred_11 ?v6)
             (pred_12 ?v10)
             (pred_2 ))



(:action op_4
:parameters (?v1 ?v5 ?v7 ?v3)
:precondition (and (pred_8 ?v1) (pred_8 ?v5) (pred_6 ?v7) (pred_3 ?v3)
          (pred_4 ?v1 ?v5) (pred_9 ?v7 ?v3)
                   (pred_7 ?v5 ?v3) (pred_1 ?v1) 
                   (pred_5 ?v5) (pred_11 ?v7))
:effect (and  (pred_12 ?v5) (not (pred_5 ?v5))))


(:action op_2
:parameters (?v1 ?v13)
:precondition (and (pred_8 ?v1) (pred_8 ?v13)
               (pred_1 ?v1) (pred_4 ?v1 ?v13) (pred_12 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v1))))

(:action op_1
:parameters (?v1 ?v7)
:precondition (and (pred_8 ?v1) (pred_6 ?v7) 
                  (pred_1 ?v1) (pred_10 ?v7 ?v1) (pred_2 ))
:effect (and (pred_11 ?v7)
   (not (pred_10 ?v7 ?v1)) (not (pred_2 ))))


(:action op_5
:parameters (?v1 ?v4 ?v9)
:precondition (and (pred_8 ?v1) (pred_6 ?v4) (pred_6 ?v9)
                  (pred_1 ?v1) (pred_11 ?v9) (pred_10 ?v4 ?v1))
:effect (and (pred_11 ?v4) (pred_10 ?v9 ?v1)
        (not (pred_11 ?v9)) (not (pred_10 ?v4 ?v1))))

(:action op_3
:parameters (?v1 ?v7)
:precondition (and (pred_8 ?v1) (pred_6 ?v7) 
                  (pred_1 ?v1) (pred_11 ?v7))
:effect (and (pred_2 ) (pred_10 ?v7 ?v1) (not (pred_11 ?v7)))))


	
