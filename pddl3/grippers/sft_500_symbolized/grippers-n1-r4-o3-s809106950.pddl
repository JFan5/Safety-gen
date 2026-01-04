(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_01 obj_03 - type_2
obj_09 obj_07 obj_05 obj_10 - type_3
obj_04 obj_02 obj_08 - object)
(:init
(pred_1 obj_06 obj_07)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_03)
(pred_4 obj_04 obj_09)
(pred_4 obj_02 obj_05)
(pred_4 obj_08 obj_10)
)
(:goal
(and
(pred_4 obj_04 obj_07)
(pred_4 obj_02 obj_07)
(pred_4 obj_08 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_06 ?b obj_03))))
)
)