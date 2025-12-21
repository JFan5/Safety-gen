(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v3)
             (pred_9 ?v8 ?v13)
             (pred_1 ?v6 ?v13)
             (pred_2 ?v12 ?v6 )
	     (pred_4 ?v6)
             (pred_3 ?v2)
             (pred_8 ?v8)
             (pred_6 ?v13)
             (pred_7 ?v6)
             (pred_12 ?v8)
             (pred_5 ?v6)
             (pred_11 ))



(:action op_2
:parameters (?v11 ?v1 ?v10 ?v9)
:precondition (and (pred_3 ?v11) (pred_3 ?v1) (pred_8 ?v10) (pred_6 ?v9)
          (pred_10 ?v11 ?v1) (pred_9 ?v10 ?v9)
                   (pred_1 ?v1 ?v9) (pred_4 ?v11) 
                   (pred_7 ?v1) (pred_12 ?v10))
:effect (and  (pred_5 ?v1) (not (pred_7 ?v1))))


(:action op_4
:parameters (?v11 ?v4)
:precondition (and (pred_3 ?v11) (pred_3 ?v4)
               (pred_4 ?v11) (pred_10 ?v11 ?v4) (pred_5 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v11))))

(:action op_3
:parameters (?v11 ?v10)
:precondition (and (pred_3 ?v11) (pred_8 ?v10) 
                  (pred_4 ?v11) (pred_2 ?v10 ?v11) (pred_11 ))
:effect (and (pred_12 ?v10)
   (not (pred_2 ?v10 ?v11)) (not (pred_11 ))))


(:action op_1
:parameters (?v11 ?v7 ?v5)
:precondition (and (pred_3 ?v11) (pred_8 ?v7) (pred_8 ?v5)
                  (pred_4 ?v11) (pred_12 ?v5) (pred_2 ?v7 ?v11))
:effect (and (pred_12 ?v7) (pred_2 ?v5 ?v11)
        (not (pred_12 ?v5)) (not (pred_2 ?v7 ?v11))))

(:action op_5
:parameters (?v11 ?v10)
:precondition (and (pred_3 ?v11) (pred_8 ?v10) 
                  (pred_4 ?v11) (pred_12 ?v10))
:effect (and (pred_11 ) (pred_2 ?v10 ?v11) (not (pred_12 ?v10)))))


	
