(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_01 obj_03 - type_3
obj_09 obj_07 obj_02 - type_1
obj_05 obj_04 obj_08 - object)
(:init
(pred_3 obj_06 obj_07)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_03)
(pred_4 obj_05 obj_07)
(pred_4 obj_04 obj_09)
(pred_4 obj_08 obj_07)
)
(:goal
(and
(pred_4 obj_05 obj_09)
(pred_4 obj_04 obj_09)
(pred_4 obj_08 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_03))))
)
)