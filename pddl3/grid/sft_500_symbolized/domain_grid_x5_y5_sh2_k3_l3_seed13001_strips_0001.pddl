(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v10 ?v8)
             (pred_1 ?v2 ?v12)
             (pred_6 ?v10 ?v12)
             (pred_3 ?v1 ?v10 )
	     (pred_2 ?v10)
             (pred_12 ?v6)
             (pred_11 ?v2)
             (pred_9 ?v12)
             (pred_4 ?v10)
             (pred_7 ?v2)
             (pred_10 ?v10)
             (pred_8 ))



(:action op_3
:parameters (?v9 ?v11 ?v3 ?v7)
:precondition (and (pred_12 ?v9) (pred_12 ?v11) (pred_11 ?v3) (pred_9 ?v7)
          (pred_5 ?v9 ?v11) (pred_1 ?v3 ?v7)
                   (pred_6 ?v11 ?v7) (pred_2 ?v9) 
                   (pred_4 ?v11) (pred_7 ?v3))
:effect (and  (pred_10 ?v11) (not (pred_4 ?v11))))


(:action op_5
:parameters (?v9 ?v5)
:precondition (and (pred_12 ?v9) (pred_12 ?v5)
               (pred_2 ?v9) (pred_5 ?v9 ?v5) (pred_10 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v9))))

(:action op_1
:parameters (?v9 ?v3)
:precondition (and (pred_12 ?v9) (pred_11 ?v3) 
                  (pred_2 ?v9) (pred_3 ?v3 ?v9) (pred_8 ))
:effect (and (pred_7 ?v3)
   (not (pred_3 ?v3 ?v9)) (not (pred_8 ))))


(:action op_2
:parameters (?v9 ?v13 ?v4)
:precondition (and (pred_12 ?v9) (pred_11 ?v13) (pred_11 ?v4)
                  (pred_2 ?v9) (pred_7 ?v4) (pred_3 ?v13 ?v9))
:effect (and (pred_7 ?v13) (pred_3 ?v4 ?v9)
        (not (pred_7 ?v4)) (not (pred_3 ?v13 ?v9))))

(:action op_4
:parameters (?v9 ?v3)
:precondition (and (pred_12 ?v9) (pred_11 ?v3) 
                  (pred_2 ?v9) (pred_7 ?v3))
:effect (and (pred_8 ) (pred_3 ?v3 ?v9) (not (pred_7 ?v3)))))


	
