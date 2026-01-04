; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1010907011 --problem-name spanner-s4-n3-l4-s1010907011
(define (problem spanner-s4-n3-l4-s1010907011)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_05 obj_09 obj_10 obj_06 - type_5
     obj_11 obj_07 obj_12 - type_1
     obj_04 obj_08 obj_14 obj_03 - type_3
     obj_02 obj_13 - type_3
    )
 (:init 
    (pred_2 obj_01 obj_02)
    (pred_2 obj_05 obj_14)
    (pred_4 obj_05)
    (pred_2 obj_09 obj_04)
    (pred_4 obj_09)
    (pred_2 obj_10 obj_08)
    (pred_4 obj_10)
    (pred_2 obj_06 obj_14)
    (pred_4 obj_06)
    (pred_1 obj_11)
    (pred_2 obj_11 obj_13)
    (pred_1 obj_07)
    (pred_2 obj_07 obj_13)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_13)
    (pred_5 obj_02 obj_04)
    (pred_5 obj_03 obj_13)
    (pred_5 obj_04 obj_08)
    (pred_5 obj_08 obj_14)
    (pred_5 obj_14 obj_03)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_07)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
