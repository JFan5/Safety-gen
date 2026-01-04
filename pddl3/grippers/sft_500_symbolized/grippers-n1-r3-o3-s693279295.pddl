(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_06 obj_05 - type_2
obj_01 obj_07 obj_09 - type_3
obj_03 obj_04 obj_08 - object)
(:init
(pred_1 obj_02 obj_09)
(pred_2 obj_02 obj_06)
(pred_2 obj_02 obj_05)
(pred_4 obj_03 obj_09)
(pred_4 obj_04 obj_07)
(pred_4 obj_08 obj_09)
)
(:goal
(and
(pred_4 obj_03 obj_07)
(pred_4 obj_04 obj_07)
(pred_4 obj_08 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_02 ?b obj_05))))
)
)