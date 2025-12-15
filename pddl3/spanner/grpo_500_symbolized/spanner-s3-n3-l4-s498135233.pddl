; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 498135233 --problem-name spanner-s3-n3-l4-s498135233
(define (problem spanner-s3-n3-l4-s498135233)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_01 obj_13 obj_04 - type_5
     obj_05 obj_02 obj_12 - type_1
     obj_11 obj_07 obj_06 obj_03 - type_3
     obj_10 obj_08 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_10)
    (pred_3 obj_01 obj_06)
    (pred_1 obj_01)
    (pred_3 obj_13 obj_07)
    (pred_1 obj_13)
    (pred_3 obj_04 obj_11)
    (pred_1 obj_04)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_08)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_08)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_08)
    (pred_4 obj_10 obj_11)
    (pred_4 obj_03 obj_08)
    (pred_4 obj_11 obj_07)
    (pred_4 obj_07 obj_06)
    (pred_4 obj_06 obj_03)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_02)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
