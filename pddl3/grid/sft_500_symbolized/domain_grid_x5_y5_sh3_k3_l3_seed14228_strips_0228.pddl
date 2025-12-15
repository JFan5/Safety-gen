(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v11)
             (pred_12 ?v12 ?v9)
             (pred_2 ?v5 ?v9)
             (pred_5 ?v8 ?v5 )
	     (pred_1 ?v5)
             (pred_10 ?v3)
             (pred_9 ?v12)
             (pred_3 ?v9)
             (pred_4 ?v5)
             (pred_11 ?v12)
             (pred_7 ?v5)
             (pred_8 ))



(:action op_4
:parameters (?v6 ?v2 ?v1 ?v4)
:precondition (and (pred_10 ?v6) (pred_10 ?v2) (pred_9 ?v1) (pred_3 ?v4)
          (pred_6 ?v6 ?v2) (pred_12 ?v1 ?v4)
                   (pred_2 ?v2 ?v4) (pred_1 ?v6) 
                   (pred_4 ?v2) (pred_11 ?v1))
:effect (and  (pred_7 ?v2) (not (pred_4 ?v2))))


(:action op_5
:parameters (?v6 ?v13)
:precondition (and (pred_10 ?v6) (pred_10 ?v13)
               (pred_1 ?v6) (pred_6 ?v6 ?v13) (pred_7 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v6))))

(:action op_3
:parameters (?v6 ?v1)
:precondition (and (pred_10 ?v6) (pred_9 ?v1) 
                  (pred_1 ?v6) (pred_5 ?v1 ?v6) (pred_8 ))
:effect (and (pred_11 ?v1)
   (not (pred_5 ?v1 ?v6)) (not (pred_8 ))))


(:action op_2
:parameters (?v6 ?v7 ?v10)
:precondition (and (pred_10 ?v6) (pred_9 ?v7) (pred_9 ?v10)
                  (pred_1 ?v6) (pred_11 ?v10) (pred_5 ?v7 ?v6))
:effect (and (pred_11 ?v7) (pred_5 ?v10 ?v6)
        (not (pred_11 ?v10)) (not (pred_5 ?v7 ?v6))))

(:action op_1
:parameters (?v6 ?v1)
:precondition (and (pred_10 ?v6) (pred_9 ?v1) 
                  (pred_1 ?v6) (pred_11 ?v1))
:effect (and (pred_8 ) (pred_5 ?v1 ?v6) (not (pred_11 ?v1)))))


	
