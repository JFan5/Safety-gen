(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v13)
             (pred_11 ?v8 ?v2)
             (pred_2 ?v7 ?v2)
             (pred_4 ?v12 ?v7 )
	     (pred_10 ?v7)
             (pred_1 ?v6)
             (pred_6 ?v8)
             (pred_5 ?v2)
             (pred_7 ?v7)
             (pred_3 ?v8)
             (pred_12 ?v7)
             (pred_9 ))



(:action op_1
:parameters (?v5 ?v11 ?v9 ?v10)
:precondition (and (pred_1 ?v5) (pred_1 ?v11) (pred_6 ?v9) (pred_5 ?v10)
          (pred_8 ?v5 ?v11) (pred_11 ?v9 ?v10)
                   (pred_2 ?v11 ?v10) (pred_10 ?v5) 
                   (pred_7 ?v11) (pred_3 ?v9))
:effect (and  (pred_12 ?v11) (not (pred_7 ?v11))))


(:action op_5
:parameters (?v5 ?v4)
:precondition (and (pred_1 ?v5) (pred_1 ?v4)
               (pred_10 ?v5) (pred_8 ?v5 ?v4) (pred_12 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v5))))

(:action op_3
:parameters (?v5 ?v9)
:precondition (and (pred_1 ?v5) (pred_6 ?v9) 
                  (pred_10 ?v5) (pred_4 ?v9 ?v5) (pred_9 ))
:effect (and (pred_3 ?v9)
   (not (pred_4 ?v9 ?v5)) (not (pred_9 ))))


(:action op_2
:parameters (?v5 ?v1 ?v3)
:precondition (and (pred_1 ?v5) (pred_6 ?v1) (pred_6 ?v3)
                  (pred_10 ?v5) (pred_3 ?v3) (pred_4 ?v1 ?v5))
:effect (and (pred_3 ?v1) (pred_4 ?v3 ?v5)
        (not (pred_3 ?v3)) (not (pred_4 ?v1 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_1 ?v5) (pred_6 ?v9) 
                  (pred_10 ?v5) (pred_3 ?v9))
:effect (and (pred_9 ) (pred_4 ?v9 ?v5) (not (pred_3 ?v9)))))


	
