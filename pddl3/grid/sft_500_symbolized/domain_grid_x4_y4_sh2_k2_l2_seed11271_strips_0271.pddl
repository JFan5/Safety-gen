(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v3)
             (pred_7 ?v6 ?v8)
             (pred_8 ?v12 ?v8)
             (pred_2 ?v4 ?v12 )
	     (pred_10 ?v12)
             (pred_3 ?v10)
             (pred_4 ?v6)
             (pred_12 ?v8)
             (pred_5 ?v12)
             (pred_1 ?v6)
             (pred_11 ?v12)
             (pred_6 ))



(:action op_2
:parameters (?v11 ?v1 ?v5 ?v9)
:precondition (and (pred_3 ?v11) (pred_3 ?v1) (pred_4 ?v5) (pred_12 ?v9)
          (pred_9 ?v11 ?v1) (pred_7 ?v5 ?v9)
                   (pred_8 ?v1 ?v9) (pred_10 ?v11) 
                   (pred_5 ?v1) (pred_1 ?v5))
:effect (and  (pred_11 ?v1) (not (pred_5 ?v1))))


(:action op_4
:parameters (?v11 ?v7)
:precondition (and (pred_3 ?v11) (pred_3 ?v7)
               (pred_10 ?v11) (pred_9 ?v11 ?v7) (pred_11 ?v7))
:effect (and (pred_10 ?v7) (not (pred_10 ?v11))))

(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_3 ?v11) (pred_4 ?v5) 
                  (pred_10 ?v11) (pred_2 ?v5 ?v11) (pred_6 ))
:effect (and (pred_1 ?v5)
   (not (pred_2 ?v5 ?v11)) (not (pred_6 ))))


(:action op_1
:parameters (?v11 ?v13 ?v2)
:precondition (and (pred_3 ?v11) (pred_4 ?v13) (pred_4 ?v2)
                  (pred_10 ?v11) (pred_1 ?v2) (pred_2 ?v13 ?v11))
:effect (and (pred_1 ?v13) (pred_2 ?v2 ?v11)
        (not (pred_1 ?v2)) (not (pred_2 ?v13 ?v11))))

(:action op_5
:parameters (?v11 ?v5)
:precondition (and (pred_3 ?v11) (pred_4 ?v5) 
                  (pred_10 ?v11) (pred_1 ?v5))
:effect (and (pred_6 ) (pred_2 ?v5 ?v11) (not (pred_1 ?v5)))))


	
