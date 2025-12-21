(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v7 ?v10)
             (pred_7 ?v1 ?v4)
             (pred_10 ?v7 ?v4)
             (pred_6 ?v13 ?v7 )
	     (pred_5 ?v7)
             (pred_8 ?v8)
             (pred_4 ?v1)
             (pred_11 ?v4)
             (pred_3 ?v7)
             (pred_2 ?v1)
             (pred_12 ?v7)
             (pred_9 ))



(:action op_5
:parameters (?v9 ?v12 ?v11 ?v5)
:precondition (and (pred_8 ?v9) (pred_8 ?v12) (pred_4 ?v11) (pred_11 ?v5)
          (pred_1 ?v9 ?v12) (pred_7 ?v11 ?v5)
                   (pred_10 ?v12 ?v5) (pred_5 ?v9) 
                   (pred_3 ?v12) (pred_2 ?v11))
:effect (and  (pred_12 ?v12) (not (pred_3 ?v12))))


(:action op_4
:parameters (?v9 ?v3)
:precondition (and (pred_8 ?v9) (pred_8 ?v3)
               (pred_5 ?v9) (pred_1 ?v9 ?v3) (pred_12 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v9))))

(:action op_1
:parameters (?v9 ?v11)
:precondition (and (pred_8 ?v9) (pred_4 ?v11) 
                  (pred_5 ?v9) (pred_6 ?v11 ?v9) (pred_9 ))
:effect (and (pred_2 ?v11)
   (not (pred_6 ?v11 ?v9)) (not (pred_9 ))))


(:action op_3
:parameters (?v9 ?v2 ?v6)
:precondition (and (pred_8 ?v9) (pred_4 ?v2) (pred_4 ?v6)
                  (pred_5 ?v9) (pred_2 ?v6) (pred_6 ?v2 ?v9))
:effect (and (pred_2 ?v2) (pred_6 ?v6 ?v9)
        (not (pred_2 ?v6)) (not (pred_6 ?v2 ?v9))))

(:action op_2
:parameters (?v9 ?v11)
:precondition (and (pred_8 ?v9) (pred_4 ?v11) 
                  (pred_5 ?v9) (pred_2 ?v11))
:effect (and (pred_9 ) (pred_6 ?v11 ?v9) (not (pred_2 ?v11)))))


	
