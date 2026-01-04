(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_3
obj_08 obj_07 - type_1
obj_09 obj_03 obj_01 obj_10 - type_2
obj_02 obj_04 obj_05 - object)
(:init
(pred_3 obj_06 obj_10)
(pred_2 obj_06 obj_08)
(pred_2 obj_06 obj_07)
(pred_4 obj_02 obj_01)
(pred_4 obj_04 obj_09)
(pred_4 obj_05 obj_01)
)
(:goal
(and
(pred_4 obj_02 obj_10)
(pred_4 obj_04 obj_09)
(pred_4 obj_05 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_07))))
)
)