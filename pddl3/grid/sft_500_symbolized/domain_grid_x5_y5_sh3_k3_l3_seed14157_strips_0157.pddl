(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v7 ?v3)
             (pred_8 ?v5 ?v8)
             (pred_11 ?v7 ?v8)
             (pred_7 ?v1 ?v7 )
	     (pred_6 ?v7)
             (pred_9 ?v12)
             (pred_2 ?v5)
             (pred_5 ?v8)
             (pred_12 ?v7)
             (pred_10 ?v5)
             (pred_1 ?v7)
             (pred_4 ))



(:action op_4
:parameters (?v6 ?v9 ?v2 ?v11)
:precondition (and (pred_9 ?v6) (pred_9 ?v9) (pred_2 ?v2) (pred_5 ?v11)
          (pred_3 ?v6 ?v9) (pred_8 ?v2 ?v11)
                   (pred_11 ?v9 ?v11) (pred_6 ?v6) 
                   (pred_12 ?v9) (pred_10 ?v2))
:effect (and  (pred_1 ?v9) (not (pred_12 ?v9))))


(:action op_1
:parameters (?v6 ?v10)
:precondition (and (pred_9 ?v6) (pred_9 ?v10)
               (pred_6 ?v6) (pred_3 ?v6 ?v10) (pred_1 ?v10))
:effect (and (pred_6 ?v10) (not (pred_6 ?v6))))

(:action op_2
:parameters (?v6 ?v2)
:precondition (and (pred_9 ?v6) (pred_2 ?v2) 
                  (pred_6 ?v6) (pred_7 ?v2 ?v6) (pred_4 ))
:effect (and (pred_10 ?v2)
   (not (pred_7 ?v2 ?v6)) (not (pred_4 ))))


(:action op_3
:parameters (?v6 ?v4 ?v13)
:precondition (and (pred_9 ?v6) (pred_2 ?v4) (pred_2 ?v13)
                  (pred_6 ?v6) (pred_10 ?v13) (pred_7 ?v4 ?v6))
:effect (and (pred_10 ?v4) (pred_7 ?v13 ?v6)
        (not (pred_10 ?v13)) (not (pred_7 ?v4 ?v6))))

(:action op_5
:parameters (?v6 ?v2)
:precondition (and (pred_9 ?v6) (pred_2 ?v2) 
                  (pred_6 ?v6) (pred_10 ?v2))
:effect (and (pred_4 ) (pred_7 ?v2 ?v6) (not (pred_10 ?v2)))))


	
