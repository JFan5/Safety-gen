(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v8)
             (pred_7 ?v10 ?v3)
             (pred_1 ?v9 ?v3)
             (pred_8 ?v4 ?v9 )
	     (pred_9 ?v9)
             (pred_12 ?v12)
             (pred_5 ?v10)
             (pred_6 ?v3)
             (pred_10 ?v9)
             (pred_3 ?v10)
             (pred_4 ?v9)
             (pred_2 ))



(:action op_1
:parameters (?v6 ?v2 ?v13 ?v1)
:precondition (and (pred_12 ?v6) (pred_12 ?v2) (pred_5 ?v13) (pred_6 ?v1)
          (pred_11 ?v6 ?v2) (pred_7 ?v13 ?v1)
                   (pred_1 ?v2 ?v1) (pred_9 ?v6) 
                   (pred_10 ?v2) (pred_3 ?v13))
:effect (and  (pred_4 ?v2) (not (pred_10 ?v2))))


(:action op_5
:parameters (?v6 ?v11)
:precondition (and (pred_12 ?v6) (pred_12 ?v11)
               (pred_9 ?v6) (pred_11 ?v6 ?v11) (pred_4 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v6))))

(:action op_2
:parameters (?v6 ?v13)
:precondition (and (pred_12 ?v6) (pred_5 ?v13) 
                  (pred_9 ?v6) (pred_8 ?v13 ?v6) (pred_2 ))
:effect (and (pred_3 ?v13)
   (not (pred_8 ?v13 ?v6)) (not (pred_2 ))))


(:action op_3
:parameters (?v6 ?v7 ?v5)
:precondition (and (pred_12 ?v6) (pred_5 ?v7) (pred_5 ?v5)
                  (pred_9 ?v6) (pred_3 ?v5) (pred_8 ?v7 ?v6))
:effect (and (pred_3 ?v7) (pred_8 ?v5 ?v6)
        (not (pred_3 ?v5)) (not (pred_8 ?v7 ?v6))))

(:action op_4
:parameters (?v6 ?v13)
:precondition (and (pred_12 ?v6) (pred_5 ?v13) 
                  (pred_9 ?v6) (pred_3 ?v13))
:effect (and (pred_2 ) (pred_8 ?v13 ?v6) (not (pred_3 ?v13)))))


	
