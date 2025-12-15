(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v4)
             (pred_8 ?v13 ?v12)
             (pred_3 ?v8 ?v12)
             (pred_2 ?v2 ?v8 )
	     (pred_7 ?v8)
             (pred_12 ?v7)
             (pred_11 ?v13)
             (pred_5 ?v12)
             (pred_10 ?v8)
             (pred_4 ?v13)
             (pred_6 ?v8)
             (pred_9 ))



(:action op_4
:parameters (?v6 ?v1 ?v11 ?v3)
:precondition (and (pred_12 ?v6) (pred_12 ?v1) (pred_11 ?v11) (pred_5 ?v3)
          (pred_1 ?v6 ?v1) (pred_8 ?v11 ?v3)
                   (pred_3 ?v1 ?v3) (pred_7 ?v6) 
                   (pred_10 ?v1) (pred_4 ?v11))
:effect (and  (pred_6 ?v1) (not (pred_10 ?v1))))


(:action op_2
:parameters (?v6 ?v9)
:precondition (and (pred_12 ?v6) (pred_12 ?v9)
               (pred_7 ?v6) (pred_1 ?v6 ?v9) (pred_6 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v6))))

(:action op_1
:parameters (?v6 ?v11)
:precondition (and (pred_12 ?v6) (pred_11 ?v11) 
                  (pred_7 ?v6) (pred_2 ?v11 ?v6) (pred_9 ))
:effect (and (pred_4 ?v11)
   (not (pred_2 ?v11 ?v6)) (not (pred_9 ))))


(:action op_5
:parameters (?v6 ?v5 ?v10)
:precondition (and (pred_12 ?v6) (pred_11 ?v5) (pred_11 ?v10)
                  (pred_7 ?v6) (pred_4 ?v10) (pred_2 ?v5 ?v6))
:effect (and (pred_4 ?v5) (pred_2 ?v10 ?v6)
        (not (pred_4 ?v10)) (not (pred_2 ?v5 ?v6))))

(:action op_3
:parameters (?v6 ?v11)
:precondition (and (pred_12 ?v6) (pred_11 ?v11) 
                  (pred_7 ?v6) (pred_4 ?v11))
:effect (and (pred_9 ) (pred_2 ?v11 ?v6) (not (pred_4 ?v11)))))


	
