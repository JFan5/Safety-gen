(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_2
obj_05 obj_07 - type_1
obj_01 obj_06 obj_03 - type_3
obj_02 obj_08 obj_04 - object)
(:init
(pred_2 obj_09 obj_06)
(pred_1 obj_09 obj_05)
(pred_1 obj_09 obj_07)
(pred_4 obj_02 obj_01)
(pred_4 obj_08 obj_01)
(pred_4 obj_04 obj_06)
)
(:goal
(and
(pred_4 obj_02 obj_03)
(pred_4 obj_08 obj_06)
(pred_4 obj_04 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_09 ?b obj_07))))
)
)