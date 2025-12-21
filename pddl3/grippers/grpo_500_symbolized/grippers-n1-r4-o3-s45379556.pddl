(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_08 obj_09 - type_3
obj_10 obj_03 obj_02 obj_01 - type_2
obj_07 obj_05 obj_04 - object)
(:init
(pred_4 obj_06 obj_10)
(pred_2 obj_06 obj_08)
(pred_2 obj_06 obj_09)
(pred_3 obj_07 obj_01)
(pred_3 obj_05 obj_02)
(pred_3 obj_04 obj_03)
)
(:goal
(and
(pred_3 obj_07 obj_02)
(pred_3 obj_05 obj_02)
(pred_3 obj_04 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_09))))
)
)