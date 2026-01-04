; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1583335721 --problem-name spanner-s4-n3-l4-s1583335721
(define (problem spanner-s4-n3-l4-s1583335721)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_05 obj_03 obj_01 obj_07 - type_3
     obj_02 obj_14 obj_09 - type_1
     obj_06 obj_04 obj_08 obj_13 - type_5
     obj_10 obj_11 - type_5
    )
 (:init 
    (pred_2 obj_12 obj_10)
    (pred_2 obj_05 obj_06)
    (pred_5 obj_05)
    (pred_2 obj_03 obj_13)
    (pred_5 obj_03)
    (pred_2 obj_01 obj_06)
    (pred_5 obj_01)
    (pred_2 obj_07 obj_06)
    (pred_5 obj_07)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_11)
    (pred_1 obj_14)
    (pred_2 obj_14 obj_11)
    (pred_1 obj_09)
    (pred_2 obj_09 obj_11)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_13 obj_11)
    (pred_3 obj_06 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_3 obj_08 obj_13)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_14)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_14))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
