(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_3
obj_08 obj_01 - type_1
obj_04 obj_03 obj_07 obj_06 - type_2
obj_02 obj_10 obj_09 - object)
(:init
(pred_4 obj_05 obj_06)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_01)
(pred_1 obj_02 obj_07)
(pred_1 obj_10 obj_06)
(pred_1 obj_09 obj_06)
)
(:goal
(and
(pred_1 obj_02 obj_07)
(pred_1 obj_10 obj_04)
(pred_1 obj_09 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_05 ?b obj_08))))
)
)