(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v6 ?v5)
             (pred_7 ?v3 ?v7)
             (pred_11 ?v6 ?v7)
             (pred_5 ?v12 ?v6 )
	     (pred_10 ?v6)
             (pred_1 ?v9)
             (pred_3 ?v3)
             (pred_9 ?v7)
             (pred_8 ?v6)
             (pred_2 ?v3)
             (pred_4 ?v6)
             (pred_12 ))



(:action op_4
:parameters (?v11 ?v1 ?v8 ?v4)
:precondition (and (pred_1 ?v11) (pred_1 ?v1) (pred_3 ?v8) (pred_9 ?v4)
          (pred_6 ?v11 ?v1) (pred_7 ?v8 ?v4)
                   (pred_11 ?v1 ?v4) (pred_10 ?v11) 
                   (pred_8 ?v1) (pred_2 ?v8))
:effect (and  (pred_4 ?v1) (not (pred_8 ?v1))))


(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_1 ?v11) (pred_1 ?v10)
               (pred_10 ?v11) (pred_6 ?v11 ?v10) (pred_4 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v11))))

(:action op_2
:parameters (?v11 ?v8)
:precondition (and (pred_1 ?v11) (pred_3 ?v8) 
                  (pred_10 ?v11) (pred_5 ?v8 ?v11) (pred_12 ))
:effect (and (pred_2 ?v8)
   (not (pred_5 ?v8 ?v11)) (not (pred_12 ))))


(:action op_5
:parameters (?v11 ?v13 ?v2)
:precondition (and (pred_1 ?v11) (pred_3 ?v13) (pred_3 ?v2)
                  (pred_10 ?v11) (pred_2 ?v2) (pred_5 ?v13 ?v11))
:effect (and (pred_2 ?v13) (pred_5 ?v2 ?v11)
        (not (pred_2 ?v2)) (not (pred_5 ?v13 ?v11))))

(:action op_3
:parameters (?v11 ?v8)
:precondition (and (pred_1 ?v11) (pred_3 ?v8) 
                  (pred_10 ?v11) (pred_2 ?v8))
:effect (and (pred_12 ) (pred_5 ?v8 ?v11) (not (pred_2 ?v8)))))


	
