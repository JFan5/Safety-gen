(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v2)
             (pred_5 ?v1 ?v12)
             (pred_3 ?v11 ?v12)
             (pred_12 ?v4 ?v11 )
	     (pred_1 ?v11)
             (pred_2 ?v10)
             (pred_11 ?v1)
             (pred_9 ?v12)
             (pred_6 ?v11)
             (pred_10 ?v1)
             (pred_4 ?v11)
             (pred_8 ))



(:action op_5
:parameters (?v9 ?v6 ?v5 ?v3)
:precondition (and (pred_2 ?v9) (pred_2 ?v6) (pred_11 ?v5) (pred_9 ?v3)
          (pred_7 ?v9 ?v6) (pred_5 ?v5 ?v3)
                   (pred_3 ?v6 ?v3) (pred_1 ?v9) 
                   (pred_6 ?v6) (pred_10 ?v5))
:effect (and  (pred_4 ?v6) (not (pred_6 ?v6))))


(:action op_1
:parameters (?v9 ?v7)
:precondition (and (pred_2 ?v9) (pred_2 ?v7)
               (pred_1 ?v9) (pred_7 ?v9 ?v7) (pred_4 ?v7))
:effect (and (pred_1 ?v7) (not (pred_1 ?v9))))

(:action op_3
:parameters (?v9 ?v5)
:precondition (and (pred_2 ?v9) (pred_11 ?v5) 
                  (pred_1 ?v9) (pred_12 ?v5 ?v9) (pred_8 ))
:effect (and (pred_10 ?v5)
   (not (pred_12 ?v5 ?v9)) (not (pred_8 ))))


(:action op_4
:parameters (?v9 ?v8 ?v13)
:precondition (and (pred_2 ?v9) (pred_11 ?v8) (pred_11 ?v13)
                  (pred_1 ?v9) (pred_10 ?v13) (pred_12 ?v8 ?v9))
:effect (and (pred_10 ?v8) (pred_12 ?v13 ?v9)
        (not (pred_10 ?v13)) (not (pred_12 ?v8 ?v9))))

(:action op_2
:parameters (?v9 ?v5)
:precondition (and (pred_2 ?v9) (pred_11 ?v5) 
                  (pred_1 ?v9) (pred_10 ?v5))
:effect (and (pred_8 ) (pred_12 ?v5 ?v9) (not (pred_10 ?v5)))))


	
