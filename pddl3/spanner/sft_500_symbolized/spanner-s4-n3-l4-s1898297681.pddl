; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1898297681 --problem-name spanner-s4-n3-l4-s1898297681
(define (problem spanner-s4-n3-l4-s1898297681)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_12 obj_02 obj_10 obj_11 - type_5
     obj_14 obj_13 obj_07 - type_4
     obj_08 obj_09 obj_06 obj_03 - type_3
     obj_01 obj_05 - type_3
    )
 (:init 
    (pred_1 obj_04 obj_01)
    (pred_1 obj_12 obj_06)
    (pred_4 obj_12)
    (pred_1 obj_02 obj_06)
    (pred_4 obj_02)
    (pred_1 obj_10 obj_08)
    (pred_4 obj_10)
    (pred_1 obj_11 obj_08)
    (pred_4 obj_11)
    (pred_3 obj_14)
    (pred_1 obj_14 obj_05)
    (pred_3 obj_13)
    (pred_1 obj_13 obj_05)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_05)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_03 obj_05)
    (pred_5 obj_08 obj_09)
    (pred_5 obj_09 obj_06)
    (pred_5 obj_06 obj_03)
)
 (:goal
  (and
   (pred_2 obj_14)
   (pred_2 obj_13)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
