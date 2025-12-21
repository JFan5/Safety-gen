(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v1)
             (pred_8 ?v7 ?v2)
             (pred_4 ?v13 ?v2)
             (pred_5 ?v5 ?v13 )
	     (pred_10 ?v13)
             (pred_9 ?v9)
             (pred_11 ?v7)
             (pred_3 ?v2)
             (pred_1 ?v13)
             (pred_6 ?v7)
             (pred_7 ?v13)
             (pred_12 ))



(:action op_1
:parameters (?v6 ?v3 ?v10 ?v8)
:precondition (and (pred_9 ?v6) (pred_9 ?v3) (pred_11 ?v10) (pred_3 ?v8)
          (pred_2 ?v6 ?v3) (pred_8 ?v10 ?v8)
                   (pred_4 ?v3 ?v8) (pred_10 ?v6) 
                   (pred_1 ?v3) (pred_6 ?v10))
:effect (and  (pred_7 ?v3) (not (pred_1 ?v3))))


(:action op_5
:parameters (?v6 ?v4)
:precondition (and (pred_9 ?v6) (pred_9 ?v4)
               (pred_10 ?v6) (pred_2 ?v6 ?v4) (pred_7 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v6))))

(:action op_2
:parameters (?v6 ?v10)
:precondition (and (pred_9 ?v6) (pred_11 ?v10) 
                  (pred_10 ?v6) (pred_5 ?v10 ?v6) (pred_12 ))
:effect (and (pred_6 ?v10)
   (not (pred_5 ?v10 ?v6)) (not (pred_12 ))))


(:action op_3
:parameters (?v6 ?v12 ?v11)
:precondition (and (pred_9 ?v6) (pred_11 ?v12) (pred_11 ?v11)
                  (pred_10 ?v6) (pred_6 ?v11) (pred_5 ?v12 ?v6))
:effect (and (pred_6 ?v12) (pred_5 ?v11 ?v6)
        (not (pred_6 ?v11)) (not (pred_5 ?v12 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_9 ?v6) (pred_11 ?v10) 
                  (pred_10 ?v6) (pred_6 ?v10))
:effect (and (pred_12 ) (pred_5 ?v10 ?v6) (not (pred_6 ?v10)))))


	
