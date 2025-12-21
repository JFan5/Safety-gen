(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v2 ?v1)
             (pred_11 ?v7 ?v10)
             (pred_12 ?v2 ?v10)
             (pred_5 ?v11 ?v2 )
	     (pred_4 ?v2)
             (pred_7 ?v8)
             (pred_10 ?v7)
             (pred_2 ?v10)
             (pred_8 ?v2)
             (pred_9 ?v7)
             (pred_3 ?v2)
             (pred_6 ))



(:action op_3
:parameters (?v13 ?v9 ?v4 ?v12)
:precondition (and (pred_7 ?v13) (pred_7 ?v9) (pred_10 ?v4) (pred_2 ?v12)
          (pred_1 ?v13 ?v9) (pred_11 ?v4 ?v12)
                   (pred_12 ?v9 ?v12) (pred_4 ?v13) 
                   (pred_8 ?v9) (pred_9 ?v4))
:effect (and  (pred_3 ?v9) (not (pred_8 ?v9))))


(:action op_2
:parameters (?v13 ?v5)
:precondition (and (pred_7 ?v13) (pred_7 ?v5)
               (pred_4 ?v13) (pred_1 ?v13 ?v5) (pred_3 ?v5))
:effect (and (pred_4 ?v5) (not (pred_4 ?v13))))

(:action op_1
:parameters (?v13 ?v4)
:precondition (and (pred_7 ?v13) (pred_10 ?v4) 
                  (pred_4 ?v13) (pred_5 ?v4 ?v13) (pred_6 ))
:effect (and (pred_9 ?v4)
   (not (pred_5 ?v4 ?v13)) (not (pred_6 ))))


(:action op_4
:parameters (?v13 ?v3 ?v6)
:precondition (and (pred_7 ?v13) (pred_10 ?v3) (pred_10 ?v6)
                  (pred_4 ?v13) (pred_9 ?v6) (pred_5 ?v3 ?v13))
:effect (and (pred_9 ?v3) (pred_5 ?v6 ?v13)
        (not (pred_9 ?v6)) (not (pred_5 ?v3 ?v13))))

(:action op_5
:parameters (?v13 ?v4)
:precondition (and (pred_7 ?v13) (pred_10 ?v4) 
                  (pred_4 ?v13) (pred_9 ?v4))
:effect (and (pred_6 ) (pred_5 ?v4 ?v13) (not (pred_9 ?v4)))))


	
