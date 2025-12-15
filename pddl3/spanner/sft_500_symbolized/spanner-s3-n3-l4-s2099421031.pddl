; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2099421031 --problem-name spanner-s3-n3-l4-s2099421031
(define (problem spanner-s3-n3-l4-s2099421031)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_10 obj_06 obj_03 - type_4
     obj_13 obj_07 obj_05 - type_1
     obj_11 obj_08 obj_04 obj_12 - type_5
     obj_09 obj_01 - type_5
    )
 (:init 
    (pred_5 obj_02 obj_09)
    (pred_5 obj_10 obj_11)
    (pred_6 obj_10)
    (pred_5 obj_06 obj_08)
    (pred_6 obj_06)
    (pred_5 obj_03 obj_04)
    (pred_6 obj_03)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_01)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_01)
    (pred_2 obj_05)
    (pred_5 obj_05 obj_01)
    (pred_3 obj_09 obj_11)
    (pred_3 obj_12 obj_01)
    (pred_3 obj_11 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_04 obj_12)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_07)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
