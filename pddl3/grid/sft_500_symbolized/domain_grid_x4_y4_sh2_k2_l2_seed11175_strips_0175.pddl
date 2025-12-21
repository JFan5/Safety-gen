(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v4)
             (pred_11 ?v6 ?v1)
             (pred_6 ?v12 ?v1)
             (pred_3 ?v8 ?v12 )
	     (pred_5 ?v12)
             (pred_2 ?v5)
             (pred_9 ?v6)
             (pred_12 ?v1)
             (pred_4 ?v12)
             (pred_7 ?v6)
             (pred_10 ?v12)
             (pred_1 ))



(:action op_2
:parameters (?v9 ?v11 ?v13 ?v10)
:precondition (and (pred_2 ?v9) (pred_2 ?v11) (pred_9 ?v13) (pred_12 ?v10)
          (pred_8 ?v9 ?v11) (pred_11 ?v13 ?v10)
                   (pred_6 ?v11 ?v10) (pred_5 ?v9) 
                   (pred_4 ?v11) (pred_7 ?v13))
:effect (and  (pred_10 ?v11) (not (pred_4 ?v11))))


(:action op_1
:parameters (?v9 ?v7)
:precondition (and (pred_2 ?v9) (pred_2 ?v7)
               (pred_5 ?v9) (pred_8 ?v9 ?v7) (pred_10 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v9))))

(:action op_4
:parameters (?v9 ?v13)
:precondition (and (pred_2 ?v9) (pred_9 ?v13) 
                  (pred_5 ?v9) (pred_3 ?v13 ?v9) (pred_1 ))
:effect (and (pred_7 ?v13)
   (not (pred_3 ?v13 ?v9)) (not (pred_1 ))))


(:action op_3
:parameters (?v9 ?v3 ?v2)
:precondition (and (pred_2 ?v9) (pred_9 ?v3) (pred_9 ?v2)
                  (pred_5 ?v9) (pred_7 ?v2) (pred_3 ?v3 ?v9))
:effect (and (pred_7 ?v3) (pred_3 ?v2 ?v9)
        (not (pred_7 ?v2)) (not (pred_3 ?v3 ?v9))))

(:action op_5
:parameters (?v9 ?v13)
:precondition (and (pred_2 ?v9) (pred_9 ?v13) 
                  (pred_5 ?v9) (pred_7 ?v13))
:effect (and (pred_1 ) (pred_3 ?v13 ?v9) (not (pred_7 ?v13)))))


	
