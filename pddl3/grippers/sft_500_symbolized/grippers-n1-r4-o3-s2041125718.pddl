(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_3
obj_06 obj_08 - type_2
obj_04 obj_10 obj_01 obj_09 - type_1
obj_07 obj_03 obj_02 - object)
(:init
(pred_1 obj_05 obj_01)
(pred_3 obj_05 obj_06)
(pred_3 obj_05 obj_08)
(pred_4 obj_07 obj_04)
(pred_4 obj_03 obj_04)
(pred_4 obj_02 obj_09)
)
(:goal
(and
(pred_4 obj_07 obj_04)
(pred_4 obj_03 obj_10)
(pred_4 obj_02 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_05 ?b obj_08))))
)
)