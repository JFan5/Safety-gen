(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v9)
             (pred_1 ?v4 ?v10)
             (pred_3 ?v6 ?v10)
             (pred_12 ?v8 ?v6 )
	     (pred_6 ?v6)
             (pred_7 ?v12)
             (pred_9 ?v4)
             (pred_2 ?v10)
             (pred_4 ?v6)
             (pred_10 ?v4)
             (pred_11 ?v6)
             (pred_5 ))



(:action op_3
:parameters (?v3 ?v11 ?v13 ?v5)
:precondition (and (pred_7 ?v3) (pred_7 ?v11) (pred_9 ?v13) (pred_2 ?v5)
          (pred_8 ?v3 ?v11) (pred_1 ?v13 ?v5)
                   (pred_3 ?v11 ?v5) (pred_6 ?v3) 
                   (pred_4 ?v11) (pred_10 ?v13))
:effect (and  (pred_11 ?v11) (not (pred_4 ?v11))))


(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_7 ?v3) (pred_7 ?v7)
               (pred_6 ?v3) (pred_8 ?v3 ?v7) (pred_11 ?v7))
:effect (and (pred_6 ?v7) (not (pred_6 ?v3))))

(:action op_1
:parameters (?v3 ?v13)
:precondition (and (pred_7 ?v3) (pred_9 ?v13) 
                  (pred_6 ?v3) (pred_12 ?v13 ?v3) (pred_5 ))
:effect (and (pred_10 ?v13)
   (not (pred_12 ?v13 ?v3)) (not (pred_5 ))))


(:action op_4
:parameters (?v3 ?v2 ?v1)
:precondition (and (pred_7 ?v3) (pred_9 ?v2) (pred_9 ?v1)
                  (pred_6 ?v3) (pred_10 ?v1) (pred_12 ?v2 ?v3))
:effect (and (pred_10 ?v2) (pred_12 ?v1 ?v3)
        (not (pred_10 ?v1)) (not (pred_12 ?v2 ?v3))))

(:action op_5
:parameters (?v3 ?v13)
:precondition (and (pred_7 ?v3) (pred_9 ?v13) 
                  (pred_6 ?v3) (pred_10 ?v13))
:effect (and (pred_5 ) (pred_12 ?v13 ?v3) (not (pred_10 ?v13)))))


	
