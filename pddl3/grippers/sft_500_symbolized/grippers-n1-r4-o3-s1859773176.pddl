(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_01 obj_09 - type_1
obj_08 obj_04 obj_02 obj_05 - type_2
obj_10 obj_03 obj_06 - object)
(:init
(pred_2 obj_07 obj_04)
(pred_1 obj_07 obj_01)
(pred_1 obj_07 obj_09)
(pred_3 obj_10 obj_04)
(pred_3 obj_03 obj_08)
(pred_3 obj_06 obj_04)
)
(:goal
(and
(pred_3 obj_10 obj_08)
(pred_3 obj_03 obj_04)
(pred_3 obj_06 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_07 ?b obj_09))))
)
)