(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_06 obj_10 obj_08 obj_02 - type_3
obj_07 obj_04 obj_01 - type_2
obj_03 obj_05 - object)
(:init
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_06)
(pred_4 obj_11 obj_10)
(pred_3 obj_09 obj_04)
(pred_4 obj_09 obj_08)
(pred_4 obj_09 obj_02)
(pred_2 obj_03 obj_04)
(pred_2 obj_05 obj_04)
)
(:goal
(and
(pred_2 obj_03 obj_07)
(pred_2 obj_05 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_01) (pred_3 obj_09 obj_01))))
  )
)
)