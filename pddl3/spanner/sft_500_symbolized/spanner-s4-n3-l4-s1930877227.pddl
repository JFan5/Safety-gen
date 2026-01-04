; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1930877227 --problem-name spanner-s4-n3-l4-s1930877227
(define (problem spanner-s4-n3-l4-s1930877227)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_04 obj_07 obj_08 obj_06 - type_2
     obj_13 obj_11 obj_10 - type_3
     obj_09 obj_14 obj_05 obj_02 - type_1
     obj_03 obj_01 - type_1
    )
 (:init 
    (pred_5 obj_12 obj_03)
    (pred_5 obj_04 obj_09)
    (pred_6 obj_04)
    (pred_5 obj_07 obj_05)
    (pred_6 obj_07)
    (pred_5 obj_08 obj_05)
    (pred_6 obj_08)
    (pred_5 obj_06 obj_05)
    (pred_6 obj_06)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_01)
    (pred_2 obj_11)
    (pred_5 obj_11 obj_01)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_01)
    (pred_4 obj_03 obj_09)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_09 obj_14)
    (pred_4 obj_14 obj_05)
    (pred_4 obj_05 obj_02)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_11)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
