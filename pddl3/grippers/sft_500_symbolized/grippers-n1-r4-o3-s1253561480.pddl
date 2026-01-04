(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_06 obj_08 - type_2
obj_10 obj_01 obj_04 obj_03 - type_1
obj_07 obj_05 obj_02 - object)
(:init
(pred_4 obj_09 obj_04)
(pred_2 obj_09 obj_06)
(pred_2 obj_09 obj_08)
(pred_1 obj_07 obj_04)
(pred_1 obj_05 obj_10)
(pred_1 obj_02 obj_01)
)
(:goal
(and
(pred_1 obj_07 obj_10)
(pred_1 obj_05 obj_04)
(pred_1 obj_02 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_09 ?b obj_08))))
)
)