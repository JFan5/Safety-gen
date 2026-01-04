(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_08 obj_06 - type_2
obj_01 obj_09 obj_03 obj_04 - type_3
obj_05 obj_02 obj_07 - object)
(:init
(pred_1 obj_10 obj_04)
(pred_4 obj_10 obj_08)
(pred_4 obj_10 obj_06)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_09)
(pred_2 obj_07 obj_04)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_02 obj_04)
(pred_2 obj_07 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_10 ?b obj_06))))
)
)