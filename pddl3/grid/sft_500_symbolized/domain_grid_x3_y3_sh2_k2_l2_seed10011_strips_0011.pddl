(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v2)
             (pred_7 ?v7 ?v1)
             (pred_12 ?v8 ?v1)
             (pred_10 ?v13 ?v8 )
	     (pred_9 ?v8)
             (pred_11 ?v3)
             (pred_8 ?v7)
             (pred_6 ?v1)
             (pred_2 ?v8)
             (pred_4 ?v7)
             (pred_5 ?v8)
             (pred_3 ))



(:action op_5
:parameters (?v9 ?v12 ?v11 ?v6)
:precondition (and (pred_11 ?v9) (pred_11 ?v12) (pred_8 ?v11) (pred_6 ?v6)
          (pred_1 ?v9 ?v12) (pred_7 ?v11 ?v6)
                   (pred_12 ?v12 ?v6) (pred_9 ?v9) 
                   (pred_2 ?v12) (pred_4 ?v11))
:effect (and  (pred_5 ?v12) (not (pred_2 ?v12))))


(:action op_1
:parameters (?v9 ?v4)
:precondition (and (pred_11 ?v9) (pred_11 ?v4)
               (pred_9 ?v9) (pred_1 ?v9 ?v4) (pred_5 ?v4))
:effect (and (pred_9 ?v4) (not (pred_9 ?v9))))

(:action op_3
:parameters (?v9 ?v11)
:precondition (and (pred_11 ?v9) (pred_8 ?v11) 
                  (pred_9 ?v9) (pred_10 ?v11 ?v9) (pred_3 ))
:effect (and (pred_4 ?v11)
   (not (pred_10 ?v11 ?v9)) (not (pred_3 ))))


(:action op_2
:parameters (?v9 ?v10 ?v5)
:precondition (and (pred_11 ?v9) (pred_8 ?v10) (pred_8 ?v5)
                  (pred_9 ?v9) (pred_4 ?v5) (pred_10 ?v10 ?v9))
:effect (and (pred_4 ?v10) (pred_10 ?v5 ?v9)
        (not (pred_4 ?v5)) (not (pred_10 ?v10 ?v9))))

(:action op_4
:parameters (?v9 ?v11)
:precondition (and (pred_11 ?v9) (pred_8 ?v11) 
                  (pred_9 ?v9) (pred_4 ?v11))
:effect (and (pred_3 ) (pred_10 ?v11 ?v9) (not (pred_4 ?v11)))))


	
