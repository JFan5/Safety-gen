(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_2
obj_06 obj_08 - type_1
obj_03 obj_07 obj_05 obj_02 - type_3
obj_10 obj_01 obj_04 - object)
(:init
(pred_2 obj_09 obj_05)
(pred_4 obj_09 obj_06)
(pred_4 obj_09 obj_08)
(pred_3 obj_10 obj_05)
(pred_3 obj_01 obj_03)
(pred_3 obj_04 obj_07)
)
(:goal
(and
(pred_3 obj_10 obj_03)
(pred_3 obj_01 obj_05)
(pred_3 obj_04 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_08))))
)
)