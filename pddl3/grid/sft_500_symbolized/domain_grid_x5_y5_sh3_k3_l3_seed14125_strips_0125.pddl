(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v8)
             (pred_11 ?v10 ?v7)
             (pred_1 ?v2 ?v7)
             (pred_9 ?v4 ?v2 )
	     (pred_4 ?v2)
             (pred_7 ?v3)
             (pred_8 ?v10)
             (pred_3 ?v7)
             (pred_12 ?v2)
             (pred_6 ?v10)
             (pred_5 ?v2)
             (pred_2 ))



(:action op_1
:parameters (?v11 ?v6 ?v13 ?v5)
:precondition (and (pred_7 ?v11) (pred_7 ?v6) (pred_8 ?v13) (pred_3 ?v5)
          (pred_10 ?v11 ?v6) (pred_11 ?v13 ?v5)
                   (pred_1 ?v6 ?v5) (pred_4 ?v11) 
                   (pred_12 ?v6) (pred_6 ?v13))
:effect (and  (pred_5 ?v6) (not (pred_12 ?v6))))


(:action op_5
:parameters (?v11 ?v1)
:precondition (and (pred_7 ?v11) (pred_7 ?v1)
               (pred_4 ?v11) (pred_10 ?v11 ?v1) (pred_5 ?v1))
:effect (and (pred_4 ?v1) (not (pred_4 ?v11))))

(:action op_3
:parameters (?v11 ?v13)
:precondition (and (pred_7 ?v11) (pred_8 ?v13) 
                  (pred_4 ?v11) (pred_9 ?v13 ?v11) (pred_2 ))
:effect (and (pred_6 ?v13)
   (not (pred_9 ?v13 ?v11)) (not (pred_2 ))))


(:action op_4
:parameters (?v11 ?v12 ?v9)
:precondition (and (pred_7 ?v11) (pred_8 ?v12) (pred_8 ?v9)
                  (pred_4 ?v11) (pred_6 ?v9) (pred_9 ?v12 ?v11))
:effect (and (pred_6 ?v12) (pred_9 ?v9 ?v11)
        (not (pred_6 ?v9)) (not (pred_9 ?v12 ?v11))))

(:action op_2
:parameters (?v11 ?v13)
:precondition (and (pred_7 ?v11) (pred_8 ?v13) 
                  (pred_4 ?v11) (pred_6 ?v13))
:effect (and (pred_2 ) (pred_9 ?v13 ?v11) (not (pred_6 ?v13)))))


	
