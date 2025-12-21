(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v13 ?v7)
             (pred_7 ?v1 ?v8)
             (pred_6 ?v13 ?v8)
             (pred_2 ?v4 ?v13 )
	     (pred_8 ?v13)
             (pred_11 ?v12)
             (pred_10 ?v1)
             (pred_5 ?v8)
             (pred_3 ?v13)
             (pred_4 ?v1)
             (pred_1 ?v13)
             (pred_9 ))



(:action op_3
:parameters (?v6 ?v2 ?v11 ?v3)
:precondition (and (pred_11 ?v6) (pred_11 ?v2) (pred_10 ?v11) (pred_5 ?v3)
          (pred_12 ?v6 ?v2) (pred_7 ?v11 ?v3)
                   (pred_6 ?v2 ?v3) (pred_8 ?v6) 
                   (pred_3 ?v2) (pred_4 ?v11))
:effect (and  (pred_1 ?v2) (not (pred_3 ?v2))))


(:action op_5
:parameters (?v6 ?v10)
:precondition (and (pred_11 ?v6) (pred_11 ?v10)
               (pred_8 ?v6) (pred_12 ?v6 ?v10) (pred_1 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v6))))

(:action op_1
:parameters (?v6 ?v11)
:precondition (and (pred_11 ?v6) (pred_10 ?v11) 
                  (pred_8 ?v6) (pred_2 ?v11 ?v6) (pred_9 ))
:effect (and (pred_4 ?v11)
   (not (pred_2 ?v11 ?v6)) (not (pred_9 ))))


(:action op_2
:parameters (?v6 ?v9 ?v5)
:precondition (and (pred_11 ?v6) (pred_10 ?v9) (pred_10 ?v5)
                  (pred_8 ?v6) (pred_4 ?v5) (pred_2 ?v9 ?v6))
:effect (and (pred_4 ?v9) (pred_2 ?v5 ?v6)
        (not (pred_4 ?v5)) (not (pred_2 ?v9 ?v6))))

(:action op_4
:parameters (?v6 ?v11)
:precondition (and (pred_11 ?v6) (pred_10 ?v11) 
                  (pred_8 ?v6) (pred_4 ?v11))
:effect (and (pred_9 ) (pred_2 ?v11 ?v6) (not (pred_4 ?v11)))))


	
