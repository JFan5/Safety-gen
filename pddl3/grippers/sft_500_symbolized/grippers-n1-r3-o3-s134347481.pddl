(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_2
obj_03 obj_07 - type_3
obj_04 obj_02 obj_01 - type_1
obj_05 obj_06 obj_09 - object)
(:init
(pred_1 obj_08 obj_01)
(pred_3 obj_08 obj_03)
(pred_3 obj_08 obj_07)
(pred_4 obj_05 obj_01)
(pred_4 obj_06 obj_01)
(pred_4 obj_09 obj_02)
)
(:goal
(and
(pred_4 obj_05 obj_01)
(pred_4 obj_06 obj_02)
(pred_4 obj_09 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_07))))
)
)