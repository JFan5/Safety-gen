(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v11 ?v8)
             (pred_3 ?v3 ?v4)
             (pred_2 ?v11 ?v4)
             (pred_11 ?v13 ?v11 )
	     (pred_9 ?v11)
             (pred_10 ?v1)
             (pred_6 ?v3)
             (pred_4 ?v4)
             (pred_8 ?v11)
             (pred_1 ?v3)
             (pred_12 ?v11)
             (pred_7 ))



(:action op_2
:parameters (?v9 ?v6 ?v7 ?v5)
:precondition (and (pred_10 ?v9) (pred_10 ?v6) (pred_6 ?v7) (pred_4 ?v5)
          (pred_5 ?v9 ?v6) (pred_3 ?v7 ?v5)
                   (pred_2 ?v6 ?v5) (pred_9 ?v9) 
                   (pred_8 ?v6) (pred_1 ?v7))
:effect (and  (pred_12 ?v6) (not (pred_8 ?v6))))


(:action op_5
:parameters (?v9 ?v12)
:precondition (and (pred_10 ?v9) (pred_10 ?v12)
               (pred_9 ?v9) (pred_5 ?v9 ?v12) (pred_12 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v9))))

(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_10 ?v9) (pred_6 ?v7) 
                  (pred_9 ?v9) (pred_11 ?v7 ?v9) (pred_7 ))
:effect (and (pred_1 ?v7)
   (not (pred_11 ?v7 ?v9)) (not (pred_7 ))))


(:action op_1
:parameters (?v9 ?v2 ?v10)
:precondition (and (pred_10 ?v9) (pred_6 ?v2) (pred_6 ?v10)
                  (pred_9 ?v9) (pred_1 ?v10) (pred_11 ?v2 ?v9))
:effect (and (pred_1 ?v2) (pred_11 ?v10 ?v9)
        (not (pred_1 ?v10)) (not (pred_11 ?v2 ?v9))))

(:action op_4
:parameters (?v9 ?v7)
:precondition (and (pred_10 ?v9) (pred_6 ?v7) 
                  (pred_9 ?v9) (pred_1 ?v7))
:effect (and (pred_7 ) (pred_11 ?v7 ?v9) (not (pred_1 ?v7)))))


	
