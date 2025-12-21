(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v13 ?v2)
             (pred_2 ?v7 ?v8)
             (pred_6 ?v13 ?v8)
             (pred_5 ?v3 ?v13 )
	     (pred_11 ?v13)
             (pred_4 ?v12)
             (pred_10 ?v7)
             (pred_9 ?v8)
             (pred_7 ?v13)
             (pred_1 ?v7)
             (pred_12 ?v13)
             (pred_3 ))



(:action op_3
:parameters (?v6 ?v9 ?v11 ?v1)
:precondition (and (pred_4 ?v6) (pred_4 ?v9) (pred_10 ?v11) (pred_9 ?v1)
          (pred_8 ?v6 ?v9) (pred_2 ?v11 ?v1)
                   (pred_6 ?v9 ?v1) (pred_11 ?v6) 
                   (pred_7 ?v9) (pred_1 ?v11))
:effect (and  (pred_12 ?v9) (not (pred_7 ?v9))))


(:action op_5
:parameters (?v6 ?v4)
:precondition (and (pred_4 ?v6) (pred_4 ?v4)
               (pred_11 ?v6) (pred_8 ?v6 ?v4) (pred_12 ?v4))
:effect (and (pred_11 ?v4) (not (pred_11 ?v6))))

(:action op_1
:parameters (?v6 ?v11)
:precondition (and (pred_4 ?v6) (pred_10 ?v11) 
                  (pred_11 ?v6) (pred_5 ?v11 ?v6) (pred_3 ))
:effect (and (pred_1 ?v11)
   (not (pred_5 ?v11 ?v6)) (not (pred_3 ))))


(:action op_4
:parameters (?v6 ?v10 ?v5)
:precondition (and (pred_4 ?v6) (pred_10 ?v10) (pred_10 ?v5)
                  (pred_11 ?v6) (pred_1 ?v5) (pred_5 ?v10 ?v6))
:effect (and (pred_1 ?v10) (pred_5 ?v5 ?v6)
        (not (pred_1 ?v5)) (not (pred_5 ?v10 ?v6))))

(:action op_2
:parameters (?v6 ?v11)
:precondition (and (pred_4 ?v6) (pred_10 ?v11) 
                  (pred_11 ?v6) (pred_1 ?v11))
:effect (and (pred_3 ) (pred_5 ?v11 ?v6) (not (pred_1 ?v11)))))


	
