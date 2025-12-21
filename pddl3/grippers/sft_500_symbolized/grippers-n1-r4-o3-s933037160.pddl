(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_05 obj_08 - type_2
obj_07 obj_03 obj_04 obj_06 - type_3
obj_10 obj_09 obj_02 - object)
(:init
(pred_1 obj_01 obj_03)
(pred_3 obj_01 obj_05)
(pred_3 obj_01 obj_08)
(pred_2 obj_10 obj_07)
(pred_2 obj_09 obj_06)
(pred_2 obj_02 obj_04)
)
(:goal
(and
(pred_2 obj_10 obj_06)
(pred_2 obj_09 obj_03)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_08))))
)
)