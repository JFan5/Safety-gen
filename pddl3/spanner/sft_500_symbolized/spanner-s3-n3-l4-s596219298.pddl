; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 596219298 --problem-name spanner-s3-n3-l4-s596219298
(define (problem spanner-s3-n3-l4-s596219298)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_06 obj_09 obj_01 - type_4
     obj_02 obj_05 obj_08 - type_2
     obj_04 obj_12 obj_10 obj_03 - type_1
     obj_11 obj_13 - type_1
    )
 (:init 
    (pred_3 obj_07 obj_11)
    (pred_3 obj_06 obj_12)
    (pred_2 obj_06)
    (pred_3 obj_09 obj_04)
    (pred_2 obj_09)
    (pred_3 obj_01 obj_10)
    (pred_2 obj_01)
    (pred_1 obj_02)
    (pred_3 obj_02 obj_13)
    (pred_1 obj_05)
    (pred_3 obj_05 obj_13)
    (pred_1 obj_08)
    (pred_3 obj_08 obj_13)
    (pred_5 obj_11 obj_04)
    (pred_5 obj_03 obj_13)
    (pred_5 obj_04 obj_12)
    (pred_5 obj_12 obj_10)
    (pred_5 obj_10 obj_03)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_05)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
