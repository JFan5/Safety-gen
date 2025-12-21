(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v3)
             (pred_10 ?v5 ?v7)
             (pred_1 ?v13 ?v7)
             (pred_9 ?v9 ?v13 )
	     (pred_6 ?v13)
             (pred_7 ?v8)
             (pred_3 ?v5)
             (pred_12 ?v7)
             (pred_5 ?v13)
             (pred_4 ?v5)
             (pred_8 ?v13)
             (pred_11 ))



(:action op_4
:parameters (?v6 ?v1 ?v11 ?v2)
:precondition (and (pred_7 ?v6) (pred_7 ?v1) (pred_3 ?v11) (pred_12 ?v2)
          (pred_2 ?v6 ?v1) (pred_10 ?v11 ?v2)
                   (pred_1 ?v1 ?v2) (pred_6 ?v6) 
                   (pred_5 ?v1) (pred_4 ?v11))
:effect (and  (pred_8 ?v1) (not (pred_5 ?v1))))


(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_7 ?v6) (pred_7 ?v4)
               (pred_6 ?v6) (pred_2 ?v6 ?v4) (pred_8 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v6))))

(:action op_5
:parameters (?v6 ?v11)
:precondition (and (pred_7 ?v6) (pred_3 ?v11) 
                  (pred_6 ?v6) (pred_9 ?v11 ?v6) (pred_11 ))
:effect (and (pred_4 ?v11)
   (not (pred_9 ?v11 ?v6)) (not (pred_11 ))))


(:action op_1
:parameters (?v6 ?v12 ?v10)
:precondition (and (pred_7 ?v6) (pred_3 ?v12) (pred_3 ?v10)
                  (pred_6 ?v6) (pred_4 ?v10) (pred_9 ?v12 ?v6))
:effect (and (pred_4 ?v12) (pred_9 ?v10 ?v6)
        (not (pred_4 ?v10)) (not (pred_9 ?v12 ?v6))))

(:action op_2
:parameters (?v6 ?v11)
:precondition (and (pred_7 ?v6) (pred_3 ?v11) 
                  (pred_6 ?v6) (pred_4 ?v11))
:effect (and (pred_11 ) (pred_9 ?v11 ?v6) (not (pred_4 ?v11)))))


	
