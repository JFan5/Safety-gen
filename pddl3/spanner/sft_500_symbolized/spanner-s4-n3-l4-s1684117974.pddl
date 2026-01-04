; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1684117974 --problem-name spanner-s4-n3-l4-s1684117974
(define (problem spanner-s4-n3-l4-s1684117974)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_04 obj_07 obj_02 obj_14 - type_4
     obj_03 obj_01 obj_06 - type_2
     obj_11 obj_08 obj_12 obj_13 - type_1
     obj_10 obj_09 - type_1
    )
 (:init 
    (pred_3 obj_05 obj_10)
    (pred_3 obj_04 obj_12)
    (pred_6 obj_04)
    (pred_3 obj_07 obj_11)
    (pred_6 obj_07)
    (pred_3 obj_02 obj_08)
    (pred_6 obj_02)
    (pred_3 obj_14 obj_08)
    (pred_6 obj_14)
    (pred_1 obj_03)
    (pred_3 obj_03 obj_09)
    (pred_1 obj_01)
    (pred_3 obj_01 obj_09)
    (pred_1 obj_06)
    (pred_3 obj_06 obj_09)
    (pred_2 obj_10 obj_11)
    (pred_2 obj_13 obj_09)
    (pred_2 obj_11 obj_08)
    (pred_2 obj_08 obj_12)
    (pred_2 obj_12 obj_13)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_01)
   (pred_4 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
