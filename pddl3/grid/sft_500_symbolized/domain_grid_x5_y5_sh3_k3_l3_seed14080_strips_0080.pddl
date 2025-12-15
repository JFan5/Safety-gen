(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v12 ?v10)
             (pred_12 ?v4 ?v7)
             (pred_5 ?v12 ?v7)
             (pred_6 ?v11 ?v12 )
	     (pred_7 ?v12)
             (pred_1 ?v2)
             (pred_8 ?v4)
             (pred_11 ?v7)
             (pred_3 ?v12)
             (pred_10 ?v4)
             (pred_9 ?v12)
             (pred_4 ))



(:action op_5
:parameters (?v6 ?v1 ?v13 ?v5)
:precondition (and (pred_1 ?v6) (pred_1 ?v1) (pred_8 ?v13) (pred_11 ?v5)
          (pred_2 ?v6 ?v1) (pred_12 ?v13 ?v5)
                   (pred_5 ?v1 ?v5) (pred_7 ?v6) 
                   (pred_3 ?v1) (pred_10 ?v13))
:effect (and  (pred_9 ?v1) (not (pred_3 ?v1))))


(:action op_1
:parameters (?v6 ?v3)
:precondition (and (pred_1 ?v6) (pred_1 ?v3)
               (pred_7 ?v6) (pred_2 ?v6 ?v3) (pred_9 ?v3))
:effect (and (pred_7 ?v3) (not (pred_7 ?v6))))

(:action op_3
:parameters (?v6 ?v13)
:precondition (and (pred_1 ?v6) (pred_8 ?v13) 
                  (pred_7 ?v6) (pred_6 ?v13 ?v6) (pred_4 ))
:effect (and (pred_10 ?v13)
   (not (pred_6 ?v13 ?v6)) (not (pred_4 ))))


(:action op_4
:parameters (?v6 ?v8 ?v9)
:precondition (and (pred_1 ?v6) (pred_8 ?v8) (pred_8 ?v9)
                  (pred_7 ?v6) (pred_10 ?v9) (pred_6 ?v8 ?v6))
:effect (and (pred_10 ?v8) (pred_6 ?v9 ?v6)
        (not (pred_10 ?v9)) (not (pred_6 ?v8 ?v6))))

(:action op_2
:parameters (?v6 ?v13)
:precondition (and (pred_1 ?v6) (pred_8 ?v13) 
                  (pred_7 ?v6) (pred_10 ?v13))
:effect (and (pred_4 ) (pred_6 ?v13 ?v6) (not (pred_10 ?v13)))))


	
