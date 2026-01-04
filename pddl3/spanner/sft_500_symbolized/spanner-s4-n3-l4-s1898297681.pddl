; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1898297681 --problem-name spanner-s4-n3-l4-s1898297681
(define (problem spanner-s4-n3-l4-s1898297681)
 (:domain spanner)
 (:objects 
     obj_14 - type_3
     obj_08 obj_09 obj_06 obj_13 - type_5
     obj_04 obj_02 obj_07 - type_4
     obj_05 obj_12 obj_01 obj_11 - type_1
     obj_10 obj_03 - type_1
    )
 (:init 
    (pred_4 obj_14 obj_10)
    (pred_4 obj_08 obj_01)
    (pred_5 obj_08)
    (pred_4 obj_09 obj_01)
    (pred_5 obj_09)
    (pred_4 obj_06 obj_05)
    (pred_5 obj_06)
    (pred_4 obj_13 obj_05)
    (pred_5 obj_13)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_03)
    (pred_3 obj_02)
    (pred_4 obj_02 obj_03)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_03)
    (pred_1 obj_10 obj_05)
    (pred_1 obj_11 obj_03)
    (pred_1 obj_05 obj_12)
    (pred_1 obj_12 obj_01)
    (pred_1 obj_01 obj_11)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_02)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_10)))
  )
)
)
