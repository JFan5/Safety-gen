(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v1 ?v13)
             (pred_3 ?v10 ?v4)
             (pred_6 ?v1 ?v4)
             (pred_1 ?v8 ?v1 )
	     (pred_8 ?v1)
             (pred_5 ?v2)
             (pred_7 ?v10)
             (pred_9 ?v4)
             (pred_10 ?v1)
             (pred_11 ?v10)
             (pred_12 ?v1)
             (pred_2 ))



(:action op_1
:parameters (?v9 ?v6 ?v12 ?v5)
:precondition (and (pred_5 ?v9) (pred_5 ?v6) (pred_7 ?v12) (pred_9 ?v5)
          (pred_4 ?v9 ?v6) (pred_3 ?v12 ?v5)
                   (pred_6 ?v6 ?v5) (pred_8 ?v9) 
                   (pred_10 ?v6) (pred_11 ?v12))
:effect (and  (pred_12 ?v6) (not (pred_10 ?v6))))


(:action op_3
:parameters (?v9 ?v11)
:precondition (and (pred_5 ?v9) (pred_5 ?v11)
               (pred_8 ?v9) (pred_4 ?v9 ?v11) (pred_12 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v9))))

(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_5 ?v9) (pred_7 ?v12) 
                  (pred_8 ?v9) (pred_1 ?v12 ?v9) (pred_2 ))
:effect (and (pred_11 ?v12)
   (not (pred_1 ?v12 ?v9)) (not (pred_2 ))))


(:action op_2
:parameters (?v9 ?v7 ?v3)
:precondition (and (pred_5 ?v9) (pred_7 ?v7) (pred_7 ?v3)
                  (pred_8 ?v9) (pred_11 ?v3) (pred_1 ?v7 ?v9))
:effect (and (pred_11 ?v7) (pred_1 ?v3 ?v9)
        (not (pred_11 ?v3)) (not (pred_1 ?v7 ?v9))))

(:action op_5
:parameters (?v9 ?v12)
:precondition (and (pred_5 ?v9) (pred_7 ?v12) 
                  (pred_8 ?v9) (pred_11 ?v12))
:effect (and (pred_2 ) (pred_1 ?v12 ?v9) (not (pred_11 ?v12)))))


	
